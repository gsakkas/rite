
let rec mulByDigit i l =
  match l with
  | [] -> 0
  | x::x' -> [[(x * i) / 10]; ((x * i) mod 10) + (mulByDigit i x')];;
