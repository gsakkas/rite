
let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> []
          | h'::t' ->
              if (List.length t') > 0
              then mulByDigit @ [(carry h i) + (remainder h' i)]
              else [remainder h i]));;
