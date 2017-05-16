
let mulByDigit i l =
  let rec helper i l acc =
    match l with | [] -> acc | h::t -> (helper (h * i)) :: acc in
  helper i l [];;
