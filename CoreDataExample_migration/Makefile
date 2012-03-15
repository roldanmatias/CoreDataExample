default:
# set default make action here
	# xcodebuild -target Tests -configuration MyMainTarget -sdk iphonesimulator build	

clean:
	-rm -rf build/*

test:
	GHUNIT_CLI=1 xcodebuild -target CoreDataExampleTests -configuration Debug -sdk iphonesimulator build	
