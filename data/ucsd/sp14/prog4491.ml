
let rec mulByDigit i l =
  match List.rev l with | [] -> [] | h::t -> [mulByDigit i t; (h * i) mod 10];;
