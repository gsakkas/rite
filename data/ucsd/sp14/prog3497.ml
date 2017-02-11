
let rec mulByDigit i l =
  let revl = List.rev l in
  match revl with
  | [] -> 0
  | h::t ->
      let prod = h * i in
      if prod > 9
      then [(mulByDigit i t) + (prod / 10); prod mod 10]
      else [mulByDigit i t; prod];;
