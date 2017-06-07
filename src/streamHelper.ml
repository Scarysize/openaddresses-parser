open Stream

let create_line_stream channel _ =
  try
    Some (input_line channel)
  with
    End_of_file -> None;;

module type StreamHelper = sig
  val line_stream_of_channel: in_channel -> string Stream.t 
end

module StreamHelper : StreamHelper = struct
  let line_stream_of_channel channel =
    Stream.from (create_line_stream channel);;
end
