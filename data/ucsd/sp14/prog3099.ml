
let rec digitsOfInt n =
  let rec integers a b =
    match a with | [] -> b | x::xs -> integers xs ((a mod 10) :: b) in
  integers n [];;
