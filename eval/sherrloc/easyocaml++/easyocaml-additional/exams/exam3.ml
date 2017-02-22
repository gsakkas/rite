(*F*)
let insert leq x =
  let rec f = function
    | [] -> [x]
    | y :: ys ->
        if leq x y then
          x :: y :: ys
        else
          y :: f ys
  in f

let sort leq =
  let insert = insert leq in
  let rec f = function
    | [] -> []
    | y :: ys -> insert y (f ys) in
  f

let leq x y = x <= y

let insert = insert leq

let rec powerset xs =
  let rec add x = function
    | [] -> []
    | xs :: xss -> insert x xs :: add x xss in
  match xs with
    | [] -> [[]]
    | x :: xs -> add x (powerset xs)

let set_insert eq x =
  let rec f = function
    | [] -> [x]
    | y :: xs -> 
        if eq x y then
          y :: xs
        else
          y :: f xs in
  f

let rec list_eq = function
  | [], [] -> true
  | x :: xs, y :: ys ->
      x = y && list_eq (xs, ys)
  | _ -> false

let set_insert = set_insert list_eq

let rec discard_least = function
  | [] -> []
  | xs :: xss ->
      match xs with
        | [] -> set_insert xs (discard_least xss)
        | _ :: rem_xs ->
            set_insert rem_xs (discard_least xss)

let silly xs =
  match powerset 0 (sort leq) xs with
    | y :: ys -> insert y ys
    | [] -> [y]


(* Here is a standard error report, for comparison:

ex3.sml:48.1-50.18 Error: case object and rules don't agree [tycon mismatch]
  rule domain: int list
  object: int list list
  in expression:
    (case ((powerset o sort leq) xs)
      of y :: ys => (insert y) ys
       | nil => <errorvar> :: nil)

*)

