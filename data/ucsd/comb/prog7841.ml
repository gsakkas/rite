
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ ([hd] * i);;
