let rec sepConcat =
  fun sep ->
    fun sl ->
      match sl with
      | [] -> ""
      | h :: t -> (let f =
                     fun a ->
                       fun x -> a ^ (sep ^ x) in
                   let base = h in
                   let l = sl in
                   List.fold_left f base l)


(* -------------------------------------- *)

let rec sepConcat =
  fun sep ->
    fun sl ->
      match sl with
      | [] -> ""
      | h :: t -> (let f =
                     fun a ->
                       fun x -> a ^ (sep ^ x) in
                   let base = "" in
                   let l = sl in
                   List.fold_left f base l)


(* -------------------------------------- *)

let rec sepConcat =
  fun sep ->
    fun sl ->
      match sl with
      | [] -> ""
      | h :: t -> (let f =
                     fun a ->
                       fun x -> a ^ (sep ^ x) in
                   let base = sep in
                   let l = sl in
                   List.fold_left f base l)


(* -------------------------------------- *)


(* bad

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = () in let l = sl in List.fold_left f base l;;

*)

(* student fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans

(7,18)-(7,20)
""
LitG

*)
