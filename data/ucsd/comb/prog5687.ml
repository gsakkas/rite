
let rec additiveDestructor n =
  (if n < 10 then n else (n / 10) additiveDestructor (n / 10) : int);;
