
let rec mulByDigit i l =
  match List.rev l with
  | [] -> false
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h1::t1 -> let rec helper acc v = [v] = [0] in helper [] h1);;
