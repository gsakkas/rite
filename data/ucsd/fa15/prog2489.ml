
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x' ->
      if (x * i) < 9
      then [(x * i) / 10] @ (mulByDigit i x')
      else [(x * i) / 10] @ ([(x * i) mod 10] + (mulByDigit i x'));;
