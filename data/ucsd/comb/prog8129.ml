
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (match List.length t with
       | 1 -> [i * h]
       | _ -> [remainder h i] @ (((i * l) / 10) + (mulByDigit i t)));;
