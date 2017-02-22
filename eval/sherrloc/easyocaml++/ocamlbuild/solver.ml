(***********************************************************************)
(*                             ocamlbuild                              *)
(*                                                                     *)
(*  Nicolas Pouillard, Berke Durak, projet Gallium, INRIA Rocquencourt *)
(*                                                                     *)
(*  Copyright 2007 Institut National de Recherche en Informatique et   *)
(*  en Automatique.  All rights reserved.  This file is distributed    *)
(*  under the terms of the Q Public License version 1.0.               *)
(*                                                                     *)
(***********************************************************************)

(* $Id: solver.ml,v 1.1.4.5 2007/12/18 08:58:02 ertai Exp $ *)
(* Original author: Nicolas Pouillard *)
open My_std
open Log
open Format
open Outcome

type backtrace =
  | Leaf of Pathname.t
  | Choice of backtrace list
  | Depth of Pathname.t * backtrace
  | Target of string * backtrace
exception Failed of backtrace
exception Circular of Pathname.t * Pathname.t list

let failed target backtrace =
  Resource.Cache.resource_failed target;
  raise (Failed backtrace)

let rec pp_repeat f (n, s) =
  if n > 0 then (pp_print_string f s; pp_repeat f (n - 1, s))

(* Targets must be normalized pathnames.
 * Recursive calls are either on input targets
 * or dependencies of these targets (returned by Rule.deps_of_rule).
 *)
let rec self depth on_the_go_orig target =
  let rules = Rule.get_rules () in
  let on_the_go = target :: on_the_go_orig in

  dprintf 4 "==%a> %a" pp_repeat (depth, "==") Resource.print target;
  if List.mem target on_the_go_orig then raise (Circular(target, on_the_go_orig));
  match Resource.Cache.resource_state target with
  | Resource.Cache.Bbuilt ->
      (dprintf 5 "%a already built" Resource.print target)
  | Resource.Cache.Bcannot_be_built ->
      (dprintf 5 "%a already failed" Resource.print target; failed target (Leaf target))
  | Resource.Cache.Bsuspension(s) ->
      (dprintf 5 "%a was suspended -> resuming" Resource.print target;
       Resource.Cache.resume_suspension s)
  | Resource.Cache.Bnot_built_yet ->
    if not (Pathname.is_relative target) && Pathname.exists target then
      if Resource.Cache.external_is_up_to_date target then ()
      else (* perhaps the error can be refined *) failed target (Leaf target)
    else
    if Resource.exists_in_source_dir target then
      Resource.Cache.import_in_build_dir target
    else
    (* FIXME tags of target
    let tags = Configuration.tags_of_target target in
    let matching_rules = List.filter_opt (Rule.tags_matches tags) rules in *)
    let matching_rules = List.filter_opt (Rule.can_produce target) (*matching_*)rules in
    match matching_rules with
    | [] -> failed target (Leaf target)
    | _ ->
      let rec until_works rs backtraces =
        match rs with
        | [] -> assert false
        | r :: rs ->
            try
              List.iter (force_self (depth + 1) on_the_go) (Rule.deps_of_rule r);
              Rule.call (self_firsts (depth + 1) on_the_go) r
            with Failed backtrace ->
              if rs = [] then failed target (Depth (target, Choice (backtrace :: backtraces)))
              else
                let () =
                  match backtrace with
                  | Depth (top_prod, _) -> Resource.Cache.clear_resource_failed top_prod
                  | Target _ | Choice _ | Leaf _ -> ()
                in until_works rs (backtrace :: backtraces)
      in until_works matching_rules []
and self_first depth on_the_go already_failed rs =
  match rs with
  | [] -> Bad (Failed (Choice already_failed))
  | r :: rs ->
      try self depth on_the_go r; Good r
      with Failed backtrace -> self_first depth on_the_go (backtrace :: already_failed) rs
and self_firsts depth on_the_go rss =
  let results = List.map (self_first depth on_the_go []) rss in
  let cmds, thunks =
    List.fold_right begin fun res ((acc1, acc2) as acc) ->
      match res with
      | Bad _ -> acc
      | Good res ->
          match Resource.Cache.get_optional_resource_suspension res with
          | None -> acc
          | Some (cmd, thunk) -> (cmd :: acc1, thunk :: acc2)
    end results ([], []) in
  let count = List.length cmds in
  let job_debug = if !Command.jobs = 1 then 10 else 5 in
  if count > 1 then dprintf job_debug ">>> PARALLEL: %d" count;
  let opt_exn = Command.execute_many cmds in
  if count > 1 then dprintf job_debug "<<< PARALLEL";
  begin match opt_exn with
  | Some(res, exn) ->
      List.iter2 (fun res thunk -> if res then thunk ()) res thunks;
      Log.finish ~how:`Error ();
      raise exn
  | None ->
      List.iter (fun thunk -> thunk ()) thunks
  end;
  results
and force_self depth on_the_go x = self depth on_the_go x; Resource.Cache.resume_resource x

let solve = force_self 0 []
let solve_target name rs =
  match self_first 0 [] [] rs with
  | Good res -> Resource.Cache.resume_resource res; res
  | Bad (Failed backtrace) -> raise (Failed (Target (name, backtrace)))
  | Bad exn -> raise exn
