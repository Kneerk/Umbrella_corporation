defmodule ENetwork do
 	require Logger

 	def accept(port) do
 		{:ok, socket} = :gen_udp.open(port, [:binary, active: false, reuseaddr: true])
 		Logger.info "Accepting connections on port #{port}"
 		serve(socket)
 	end


 	defp serve(socket) do
 	socket |> read_line() |> write_line()
 	serve(socket)
 	end

 	defp read_line(socket) do
 		{:ok, data} = :gen_udp.recv(socket, 0)
 		data
 	end

 	defp write_line(line) do
 		IO.puts(line)
 	end
end
