
let rec mulByDigit i l =
  if l = []
  then []
  else
    (let h::t = l in
     if h = []
     then []
     else
       (match t with
        | [] -> h @ []
        | _ ->
            [(h * i) / 10] @
              (mulByDigit i ([t.hd + ((i * t.hd) mod 10)] @ t.tl))));;
