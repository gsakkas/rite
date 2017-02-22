(*F*)

let mapActR f (xs, state) =
  let iter x (xs, state) =
    let x, state = f (x, state) in
    x :: xs, state in
  List.fold_right iter xs ([], state)

let mapActL f (xs, state) =
  let iter (xs, state) x =
    let x, state = f (x, state) in
    xs @ x, state in
  List.fold_left iter ([], state) xs

let isEven n = n / 2 = 0
                         
let doubleOdds xs =
  let f (n, inc) =
    if isEven n then
      n, inc
    else
      2 * n, inc + n in
  mapActL f (xs, 0)

(* Here is a typical error report, for comparison:

ex2.sml:21.1-25.24 Error: operator and operand don't agree [tycon mismatch]
  operator domain: int * int -> 'Z list * int
  operand:         int * int -> int * int
  in expression:
    mapActL f

*)


