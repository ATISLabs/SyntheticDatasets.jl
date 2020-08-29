using PyCall: pyimport_conda
using Conda

function installpypackage()
	try
		pyimport_conda("scikit-learn")
	catch
		try
			Conda.add("scikit-learn")
		catch
			println("scikit-learn failed to install")
		end
	end
end

installpypackage()