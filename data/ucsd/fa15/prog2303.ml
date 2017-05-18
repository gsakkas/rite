
let rec mulByDigit i l =
  match l with
  | [] -> []
  | z::x::x' -> [(x * i) / 10] @ (mulByDigit i [((x * i) mod 10) + z; x']);;
