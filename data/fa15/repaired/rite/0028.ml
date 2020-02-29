let rec sepConcat =
  fun sep ->
    fun sl ->
      match sl with
      | [] -> ""
      | h :: t -> (let f =
                     fun a ->
                       fun x -> a ^ (sep ^ x) in
                   let base = h in
                   let l = t in
                   List.fold_left f base l)

let stringOfList =
  fun f ->
    fun l ->
      "[" ^ ((let __var_1__ =
                sepConcat l f in
              l) ^ "]")


(* -------------------------------------- *)

let rec sepConcat =
  fun sep ->
    fun sl ->
      match sl with
      | [] -> ""
      | h :: t -> (let f =
                     fun a ->
                       fun x -> a ^ (sep ^ x) in
                   let base = h in
                   let l = t in
                   List.fold_left f base l)

let stringOfList =
  fun f ->
    fun l ->
      "[" ^ ((let __var_1__ =
                sepConcat f l in
              f) ^ "]")


(* -------------------------------------- *)

let rec sepConcat =
  fun sep ->
    fun sl ->
      match sl with
      | [] -> ""
      | h :: t -> (let f =
                     fun a ->
                       fun x -> a ^ (sep ^ x) in
                   let base = h in
                   let l = t in
                   List.fold_left f base l)

let stringOfList =
  fun f ->
    fun l ->
      "[" ^ ((let __var_1__ =
                sepConcat "; " l in
              f) ^ "]")


(* -------------------------------------- *)


(* bad

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " List.map f l) ^ "]");;

*)

(* student fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

*)

(* changed spans

(9,31)-(9,60)
sepConcat "; " (List.map f l)
AppG [LitG,AppG [EmptyG,EmptyG]]

*)
