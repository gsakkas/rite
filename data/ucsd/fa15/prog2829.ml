
let rec mulByDigit i l =
  match l with | [] -> [] | 0 -> [] | hd::tl -> (mulByDigit i tl) @ (hd * i);;
