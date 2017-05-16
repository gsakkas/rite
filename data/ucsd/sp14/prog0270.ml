
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let f a x = a + x in
           let base = 0 in
           (match [List.fold_left f base (h :: t)] with
            | [] -> []
            | a::b ->
                let rec helper acc v =
                  if v = 0
                  then acc
                  else ((v / 10) mod 10) :: ((v mod 10) :: acc) :: acc in
                helper [] a));;
