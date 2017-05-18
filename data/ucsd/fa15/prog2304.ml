
let rec mulByDigit i l =
  if (List.length l) = 1
  then [l * i]
  else
    (match l with
     | [] -> []
     | z::x::x' ->
         [(z * i) / 10] @ ((mulByDigit i [((z * i) mod 10) + x]) @ x'));;
