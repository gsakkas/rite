
let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> [hd * i] @ [mulByDigit i tl];;
