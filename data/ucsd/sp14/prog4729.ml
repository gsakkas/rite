
let mulByDigit i l =
  let rec helper i l acc =
    match l with | [] -> acc | h::t -> (helper (t * i)) :: acc in
  helper i l [];;
