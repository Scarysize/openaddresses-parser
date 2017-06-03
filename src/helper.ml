open Stream

module Helper =
  struct
    let line_stream_of_channel channel = 
      Stream.from
        (fun _ ->
          try Some (input_line channel) with End_of_file -> None);;
  end
