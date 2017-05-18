
let rec mulByDigit i l =
  match l with | [] -> [] | h::t -> [h * i] @ (0 * (mulByDigit i t));;
