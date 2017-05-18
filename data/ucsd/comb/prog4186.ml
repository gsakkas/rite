
let rec mulByDigit i l =
  let lr = List.rev l in
  match lr with
  | (_,[]) -> ((((fst x) * (snd x)) / 10), [((fst x) * (snd x)) mod 10])
  | (c,h::t) ->
      let sum = c + ((fst x) * (snd x)) in
      ((sum / 10), ((sum mod 10) :: (snd a)));;
