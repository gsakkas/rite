
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x' -> [[(x * i) / 10]; ((x * i) mod 10) + [mulByDigit i x']];;
