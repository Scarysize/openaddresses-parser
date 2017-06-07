module type FileWriterType = sig
  val create : string -> (string -> unit) * (unit -> unit)
end

module FileWriter : FileWriterType = struct
  let create output_file = 
    let out = open_out output_file in
    (output_string out, fun () -> close_out out);
end
