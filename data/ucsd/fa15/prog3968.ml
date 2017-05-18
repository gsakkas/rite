
let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i <= 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> [remainder i h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;

let _ = mulByDigit - (1 [2; 3]);;
