
let _ =
  let rec mulByDigit i l =
    let (i',l') = (0, (List.rev l)) in
    match l' with
    | [] -> []
    | h::t -> (((h * i) + i') mod 10) ::
        (mulByDigit ((((h * i) + i') / 10), t)) in
  List.rev (mulByDigit i l);;
