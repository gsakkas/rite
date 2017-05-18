
let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then [] :: return else (n mod 10) :: return;
  (digitsOfInt 0) @ return;;
