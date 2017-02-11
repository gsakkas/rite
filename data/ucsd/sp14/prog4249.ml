
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      let lastDigit = prod / 10 in
      let firstDigit = prod mod 10 in
      let ret = mulByDigit (i t) in
      (match ret with
       | [] -> 0
       | h2::t2 ->
           if h2 > 10
           then
             let temp = h2 in
             (if prod > 10
              then [lastDigit; firstDigit + temp]
              else firstDigit :: t));;
