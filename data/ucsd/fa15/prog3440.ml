
let rec mulByDigit i l =
  match l with
  | [] -> [0]
  | h::t ->
      let (cin,res) = mulByDigit i t in
      let sum = (i * h) + cin in ((sum / 10), ((sum mod 10) :: res));;
