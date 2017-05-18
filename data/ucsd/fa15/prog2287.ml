
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let (h::[])::t = l in
     match t with
     | [] -> [h]
     | _ ->
         [(h * i) / 10] @
           (mulByDigit i
              [(let (h2::[])::t2 = t in [h2 + ((h * i) mod 10)] @ [t2])]));;
