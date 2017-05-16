
let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let i = 0 in
  fun helper  ->
    fun n  ->
      (let d = digitsOfInt n in
       let s = sumList d in
       if (n / 10) <> 0
       then (print_int n; print_endline " "; incr i; helper s)
       else d) i;;
