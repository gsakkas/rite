(** This module is a collection of some handy functionality used in the rest of
  * EasyOCaml. It contains copies from existing libraries (mainly Jane Street's
  * Core) to circumvent dependencies while bootstrapping. *)

(** {3 Random helpers} *)

let curry f = fun x y -> f (x, y)
let uncurry f = fun (x, y) -> f x y
external id : 'a -> 'a = "%identity"
let const x = fun _ -> x

module Result = struct
  type ('a, 'b) t = Ok of 'a | Error of 'b
end

type 'a endomorph = 'a -> 'a

let switch_args f y x = f x y

let between f x g = let y = f x in g y; y

let failwith fmt = Printf.ksprintf failwith fmt

let format_str fmt =
  Format.kfprintf (fun _ -> Format.flush_str_formatter ()) Format.str_formatter fmt

module Infix = struct
  let (|>) x f = f x
  let ($) f x = f x
  let (<<) f g = fun x -> f (g x)
  let (>>) f g = fun x -> g (f x)
  let (//) = switch_args
  let (///) f y z = fun x -> f x y z
end

(** {3 On tuples} *)
module T2 = struct
  type 'a hom = 'a * 'a
  let create x y = (x, y)
  let map1 ~f (x, y) = f x, y
  let map2 ~f (x, y) = x, f y
  let curry ~f = fun x y -> f (x, y)
  let uncurry ~f = fun (x, y) -> f x y
  let print p1 p2 ppf (x,y) = 
    Format.fprintf ppf "(%a, %a)" p1 x p2 y
end
module T3 = struct
  let beside1 (_,x,y) = x,y
  let beside2 (x,_,y) = x,y
  let beside3 (x,y,_) = x,y
  let curry ~f = fun x y z -> f (x, y, z)
  let uncurry ~f = fun (x, y, z) -> f x y z
end
module T4 = struct
  let curry ~f = fun w x y z -> f (w, x, y, z)
  let uncurry ~f = fun (w, x, y, z) -> f w x y z
end

let not_implemented descr = 
  failwith "%s: not yet implemented" descr
let not_implemented_fun func_name: 'a -> 'b =
  fun _ ->
    failwith "%s: not yet implemented" func_name

(** {3 Comparisions} *)

(** Compare two hetergonenous pairs with comparision functions for each constituent. *)
let lexical2 cmp1 cmp2 (x, y) (x', y') =
  match cmp1 x x' with
    | 0 -> cmp2 y y'
    | n -> n

(** Lexically compare a pair [('a * 'a)]. *)
let lexical cmp = lexical2 cmp cmp

(** Compare a hetergonenous triple with comparision functions for each constituent. *)
let lexical3 cmp1 cmp2 cmp3 (x, y, z) (x', y', z') =
  match cmp1 x x' with
    | 0 -> lexical2 cmp2 cmp3 (y, z) (y', z')
    | n -> n

(** Compare two lists lexically. *)
let rec lexical_list cmp li1 li2 =
  match li1, li2 with
    | [], [] -> 0
    | _, [] -> -1
    | [], _ -> 1
    | h1 :: t1, h2 :: t2 ->
        begin match cmp h1 h2 with
          | 0 -> lexical_list cmp t1 t2
          | n -> n
        end

(** [input t] reads the contents of a channel to a string. Copied from Core 0.5 *)
let input_all t = (* copied from core 0.5 *)
  let buf = String.create 4096 in
  let buffer = Buffer.create 16 in
  let input t ~buf ~pos ~len = Pervasives.input t buf pos len in
  let rec loop () =
    let len = input t ~buf ~pos:0 ~len:(String.length buf) in
    if len > 0 then begin
      Buffer.add_substring buffer buf 0 len;
      loop ();
    end
  in
  loop ();
  Buffer.contents buffer;


(** Printing *)

module type Printable = sig
  type printable
  val print: Format.formatter -> printable -> unit
end

module type PrintableOrderedType = sig
  include Set.OrderedType
  include Printable with type printable = t
end


(** {3 Improved modules from stdlib} *)

module Option = struct
  type 'a t = 'a option
  let is_none = function None -> true | _ -> false
  let is_some = function Some _ -> true | _ -> false
  let value ~default = function
    | None -> default
    | Some x -> x
  let map ~f = function
    | None -> None
    | Some x -> f x
  let iter o ~f =
    match o with
    | None -> ()
    | Some a -> f a
  let map o ~f =
    match o with
    | None -> None
    | Some a -> Some (f a)
  let compare cmp o1 o2 =
    match o1, o2 with
      | None, None -> 0
      | Some _, None -> -1
      | None, Some _ -> 1
      | Some x1, Some x2 -> cmp x1 x2
  let for_exn f x =
    try Some (f x) with _ -> None
  let print p ppf o =
    match o with
      | None -> Format.fprintf ppf "None"
      | Some x -> Format.fprintf ppf "Some (%a)" p x
end

module List = struct

  include List

  let is_empty = function [] -> true | _ -> false
  let cons h t = h :: t

  let reduce f li =
    match li with
      | [] -> invalid_arg "List.reduce"
      | h :: t -> List.fold_left f h t

  let init f n =
    let rec aux acc m =
      if m = n then
        List.rev acc
      else
        aux (f m :: acc) (succ m) in
    aux [] 0

  let split3 ls =
    let rec aux acc1 acc2 acc3 = function
      | [] ->
          List.rev acc1, List.rev acc2, List.rev acc3
      | (x, y, z) :: rem ->
          aux (x :: acc1) (y :: acc2) (z :: acc3) rem in
    aux [] [] [] ls

  let combine3 ls1 ls2 ls3 =
    let rec aux acc = function
      | [], [], [] ->
          List.rev acc
      | x :: rem1, y :: rem2, z :: rem3 ->
          aux ((x, y, z) :: acc) (rem1, rem2, rem3)
      | _ -> invalid_arg "List.combine3" in
    aux [] (ls1, ls2, ls3)

  let fold_pairwise f ls init =
    let rec inner acc x = function
      | [] -> acc
      | y :: rem ->
          inner (f x y acc) x rem in
    let rec outer acc = function
      | [] -> acc
      | x :: rem ->
          outer (inner acc x rem) rem in
    outer ls init

  let foldmap f init ls =
    let f x (sofar, ls) =
      let sofar, y = f sofar x in
      sofar, y :: ls in
    List.fold_right f ls (init, [])

  let foldmapi f init ls =
    let f x (sofar, ls, i) =
      let sofar, y = f i sofar x in
      sofar, y :: ls, i+1 in
    List.fold_right f ls (init, [], 0)

  (** [rev_filter_map ~f l] applies [f] to [l], filtering out elements
      for which [f] returns [None], and unwrapping those that return [Some].
      Returns reversed list. *)
  let rev_filter_map l ~f = (* From core0.5 *)
    let rec loop l accum = match l with
      | [] -> accum
      | hd :: tl ->
          match f hd with
          | Some x -> loop tl (x :: accum)
          | None -> loop tl accum
    in
    loop l []

  (** [filter_map ~f l] applies [f] to [l], filtering out elements for which
      [f] returns [None], and unwrapping those that return [Some] *)
  let filter_map l ~f = List.rev (rev_filter_map ~f l) (* From core0.5 *)

  let rec map_option f = function
    | [] -> []
    | (x::xs) ->
        match f x with
          | None -> map_option f xs
          | Some y -> y :: map_option f xs
    
  let print p sep ppf li =
    match li with
      | [] -> ()
      | x :: rest ->
          p ppf x ; 
          let f x =
            Format.fprintf ppf sep ;
            p ppf x in
          List.iter f rest
end

module Set = struct
  module Standard = Set

  module type S = sig
    include Set.S
    include Printable with type printable = t
    val print_sep : (unit, Format.formatter, unit) format -> Format.formatter -> printable -> unit

    val big_union: t list -> t
    val big_inter: t list -> t
    val splint: t -> (elt * t) option
    val from_list: elt list -> t
    val map: (elt -> elt) -> t -> t
  end

  module Make (Ord: PrintableOrderedType) : S with type elt = Ord.t = struct
    include Set.Make(Ord)

    type printable = t

    let print_sep sep ppf set =
      let printer x =
        Ord.print ppf x ;
        Format.fprintf ppf sep in
      Format.fprintf ppf "@[<1>{" ;
      iter printer set ;
      Format.fprintf ppf "}@]"

    let print = print_sep ";@ "

    let big_union sets =
      List.fold_left union empty sets

    let big_inter = function
      | [] -> empty
      | set :: sets -> List.fold_left inter set sets

    let splint set =
      if is_empty set
      then None
      else
        let elt = choose set in
        Some (elt, remove elt set)

    let from_list li =
      List.fold_right add li empty

    let map f set =
      fold (fun x -> add (f x)) set empty
  end
end


module Map = struct
  module Standard = Map

  module type S = sig
    include Map.S
    module KeySet : Set.S with type elt = key
    val print : (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a t -> unit
    val print_sep : (unit, Format.formatter, unit) format -> (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a t -> unit
    val from_list : (key * 'a) list -> 'a t
    val to_list : 'a t -> (key * 'a) list
    val keys : 'a t -> KeySet.t
    val singleton : key -> 'a -> 'a t
    val update : 'a t -> 'a t -> 'a t
  end

  module Make (Ord: PrintableOrderedType) : S with type key = Ord.t = struct
    include Map.Make(Ord)

    let print_sep sep p ppf m =
      let f ppf key value =
        Format.fprintf ppf "%a -> %a" Ord.print key p value ;
        Format.fprintf ppf sep in
      Format.fprintf ppf "@[<1>{%t}@]" (fun ppf -> iter (f ppf) m)

    let print p ppf m = print_sep ";@ " p ppf m

    let from_list pairs =
      List.fold_right (fun (key, value) -> add key value) pairs empty

    let to_list m =
      let f key value sofar = (key, value) :: sofar in
      fold f m []

    let singleton key value =
      add key value empty

    let update m1 m2 =
      fold add m2 m1

    module KeySet = Set.Make(Ord)

    let keys m =
      let f key _ sofar = KeySet.add key sofar in
      fold f m KeySet.empty
  end
end

module String = struct
  include String
  type printable = t
  let print ppf var =
    Format.fprintf ppf "%s" var
  let check_prefix s pref = (* copied from core 0.5 *)
    let len_pref = String.length pref in
    String.length s >= len_pref
    && (let rec loop i =
          i = len_pref || (pref.[i] = s.[i] && loop (i + 1)) 
        in
        loop 0)
  let check_suffix name suff =
    let len_name = String.length name in
    let len_suff = String.length suff in
    if len_name < len_suff then false
    else
      try
        for i = 1 to len_suff do
          if suff.[len_suff - i] <> name.[len_name - i] then raise Exit
        done;
        true
      with Exit -> false
end

module Sys = struct
  include Sys
  let dir_exists name =
    try is_directory name
    with Sys_error _ -> false
end

module StringMap = Map.Make(String)
module StringSet = StringMap.KeySet

(** {3 Monads} *)

module Monad = struct
  module type Basic = sig 
    type 'a t
    val bind : 'a t -> ('a -> 'b t) -> 'b t
    val return : 'a -> 'a t
  end

  module type Infix = sig
    type 'a monad

    (** [t >>= f] returns a computation that sequences the computations
        represented by two monad elements.  The resulting computation first does
        [t] to yield a value [v], and then runs the computation returned by [f v].
    *)
    val (>>=) : 'a monad -> ('a -> 'b monad) -> 'b monad

    val (>>) : unit monad -> (unit -> 'a monad) -> 'a monad

    (** [t >>| f] is [t >>= (fun a -> return (f a))]. *)
    val (>>|) : 'a monad -> ('a -> 'b) -> 'b monad
  end
  module type S = sig
    include Infix

    module Monad_infix : Infix with type 'a monad = 'a monad

    (** [bind t f] = [t >>= f] *)
    val bind : 'a monad -> ('a -> 'b monad) -> 'b monad

    (** [return v] returns the (trivial) computation that returns v. *)
    val return : 'a -> 'a monad

    (** [map t ~f] is t >>| f. *)
    val map : 'a monad -> f:('a -> 'b) -> 'b monad

    (** [join t] is [t >>= (fun t' -> t')]. *)
    val join : 'a monad monad -> 'a monad

    (** [ignore t] = map t ~f:(fun _ -> ()). *)
    val ignore : 'a monad -> unit monad

    (** [unit] = [return ()] *)
    val unit : unit monad
    val accumulate : ('a monad) list -> 'a list monad
  end
  module Make (M: Basic) = struct
    let bind = M.bind

    let return = M.return
      
    module Monad_infix = struct
      type 'a monad = 'a M.t
      
      let (>>=) = bind

      let (>>) t f = t >>= (fun () -> f ())

      let (>>|) t f = t >>= (fun a -> return (f a))
    end

    include Monad_infix

    let join t = t >>= (fun t' -> t')

    let map t ~f = t >>| f

    let ignore t = map t ~f:(fun _ -> ())

    let unit = return ()
    let rec accumulate = function
      | [] -> return []
      | m :: rem ->
          m >>= fun h ->
          accumulate rem >>= fun t ->
          return (h :: t)
  end
end


(** [StateErrorMonadBasis (State) (Error)] is a state monad with an explicit error state, in which
  * continuing code is not executed.
  *)
module StateErrorMonadBasis (State: sig type t end) (Error: sig type t val set_context : t -> t -> t end) : sig
  include Monad.Basic
  val fail : Error.t -> 'a t
  val inspect : State.t t
  val inject : (State.t -> State.t) -> unit t
  val ok : unit t
  val perform : State.t -> 'a t -> ('a -> State.t -> 'b) -> (Error.t -> State.t -> 'b) -> 'b
  val between: 'a t -> (('a, Error.t) Result.t -> unit) -> 'a t
  val set_context_on_error : Error.t -> 'a t -> 'a t
end = struct

  type 'a t = M of (State.t -> ('a * State.t, Error.t * State.t) Result.t)

  let set_context_on_error context (M m) =
    M (fun st ->
         match m st with
           | Result.Ok _ as res -> res
           | Result.Error (err, st) ->
               Result.Error (Error.set_context context err, st))

  let bind (M m: 'a t) (f: 'a -> 'b t) : 'b t =
    M (fun st ->
         match m st with
           | Result.Ok (x, st) ->
               let M k = f x in
               k st
           | Result.Error (err, st) ->
               Result.Error (err, st))

  let fail msg =
    M (fun st ->
         Result.Error (msg, st))

  let return x =
    M (fun st ->
         Result.Ok (x, st))

  let inspect =
    M (fun st ->
         Result.Ok (st, st))

  let inject apply =
    M (fun st ->
         Result.Ok ((), apply st))

  let between (M m) f =
    M (fun st ->
         match m st with
           | Result.Ok (x, st) ->
               let () = f (Result.Ok x) in
               Result.Ok (x, st)
           | Result.Error (err, st) ->
               let () = f (Result.Error err) in
               Result.Error (err, st))

  let ok =
    return ()

  let perform st (M m) s f =
    match m st with
      | Result.Ok (x, st) -> s x st
      | Result.Error (msg, st) -> f msg st
end

(** {3 Logging} *)

(** This module defines the logger used in EasyOCaml. The level of detail is
  * controlled by the EASYOCAML_LOGLEVEL environment variable. Possible values
  * are "trace", "debug" "info", "warn" and "error". EASYOCAML_LOGLAYERS is a
  * (space seperated) list of layers which is logged at all. *)
module Logger = struct
  type level = Trace | Debug | Info | Warn | Error
  let level_of_string str =
    match String.lowercase str with
      | "trace" -> Trace
      | "debug" -> Debug
      | "info" -> Info
      | "warn" -> Warn
      | "error" -> Error
      | _ -> invalid_arg ("Logging.level_of_string: " ^ str)
  let level_string level =
    match level with
      | Debug -> "DBG" | Info -> "INF" | Warn -> "WRN"
      | Error -> "ERR" | Trace -> "TRC"
  let level = ref (try level_of_string (Sys.getenv "EASYOCAML_LOGLEVEL") with Not_found -> Warn)
  let layers = ref (try Some (Misc.rev_split_words (Sys.getenv "EASYOCAML_LOGLAYERS")) with Not_found -> None)
  let time_level = ref (try int_of_string (Sys.getenv "EASYOCAML_TIMELEVEL") with _ -> 0)
  let ppf = Format.std_formatter
  let null_ppf = Format.make_formatter (fun _ _ _ -> ()) (fun _ -> ())

  let get_level () = !level

  let _set_level l () = level := l
  let set_debug = _set_level Debug
  let set_info = _set_level Info
  let set_warn = _set_level Warn
  let set_error = _set_level Error
  let set_trace = _set_level Trace

  let set_layers l = layers := Some l
  let deset_layers () = layers := None

  let _log layer level indent =
    let prefix = level_string level in
    let level_matches = get_level () <= level in
    let layer_matches =
      layer = "" ||
      match !layers with None -> true | Some ls -> List.mem layer ls  in
    if level_matches && layer_matches then (
      Format.fprintf ppf "@[<2>[%s %s%s] " prefix "" layer ;
      Format.kfprintf (fun ppf -> Format.fprintf ppf "@]@.") ppf
    ) else
      Format.ifprintf ppf

(*let _time : 'a -> 'b =
    let last_times = Array.create 10 0.0 in
    fun level ->
      let current = Unix.gettimeofday () in
      let diff =
        if last_times.(level) = 0.0 then 0.0
        else current -. last_times.(level) in
      last_times.(level) <- current ;
      if !atime_level < !time_level then 
        Format.fprintf ppf "[TME] %2.4f %s %s" diff (String.make (2 * !atime_level) '-') msg ; *)

(*let _atime : string -> ('a -> 'b) -> 'a -> 'b =
    let atime_level = ref 1 in
    fun msg f x ->
      let start = Unix.gettimeofday () in
      incr atime_level ;
      let res = f x in
      decr atime_level ;
      let diff = Unix.gettimeofday () -. start in
      if !atime_level < !time_level then 
        Format.fprintf ppf "[TME] %2.4f %s %s" diff (String.make (2 * !atime_level) '-') msg ;
      res *)

  type 'a formatting = ('a, Format.formatter, unit) format -> 'a
  class logger layer = object (self)
    method error : 'a . 'a formatting = _log layer Error 1
    method warn : 'a . 'a formatting = _log layer Warn 2
    method info : 'a . 'a formatting = _log layer Info 4
    method debug : 'a . 'a formatting = _log layer Debug 6
    method trace : 'a . 'a formatting = _log layer Trace 8
    method time : 'a . int -> 'a formatting =
      fun _ fmt -> Format.ifprintf ppf fmt
(*  method atime : 'a 'b . string -> ('a -> 'b) -> 'a -> 'b =
      fun str f x -> f x *)
  end
end
