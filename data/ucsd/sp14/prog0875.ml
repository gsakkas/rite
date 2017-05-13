
let rec digitsOfInt n =
  let rec integers a b =
    match a with | [] -> b | x::xs -> integers xs (x :: b) in
  integers n [];;

let _ = digitsOfInt 3124;;
