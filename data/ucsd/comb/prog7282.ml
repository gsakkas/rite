
let rec mulByDigit i l =
  if l = []
  then []
  else (let h::t = l in match t with | [] -> h | _ -> [(h * i) / 10]);;
