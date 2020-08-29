using PyCall: pyimport_conda
using Conda

function installpypackage()
	try
		pyimport_conda("sklearn")
	catch
		try
			Conda.add("sklearn")
		catch
			println("sklearn failed to install")
		end
	end
end

installpypackage()