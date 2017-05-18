
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let (h::[])::t = l in
     let (h2::[])::t2 = t in
     match t with
     | [] -> [h]
     | _ -> [(h * i) / 10] @ [mulByDigit i ([h2 + (h mod 10)] @ t2)]);;
