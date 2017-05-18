
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      let lastDigit = prod / 10 in
      let firstDigit = prod mod 10 in
      if prod > 10
      then [lastDigit; firstDigit + (mulByDigit (i t))]
      else firstDigit :: t;;
