
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev (List.map (fun x  -> x * 10) t)); h * i];;
