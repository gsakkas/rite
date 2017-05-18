
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [h * i]
       with
       | [] -> []
       | h::t ->
           let rec helper lst =
             match lst with | [] -> [] | h1::t1 -> [helper t1; h1 mod 10] in
           helper [h]);;
