
let rec mulByDigit i l =
  let rec helper i acc l =
    if i > 0 then (helper i) - (1 (bigAdd acc l) l) else acc in
  helper i [] l;;
