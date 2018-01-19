describe "SVGPath", ->
	svg = null
	path = null
	beforeEach ->
		svg = new SVGLayer
			x: 123
			y: 456
			svg: '<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"><path d="M 100 50 C 100 77.614 77.614 100 50 100 C 22.386 100 0 77.614 0 50 C 0 22.386 22.386 0 50 0" id="path" name="path" fill="transparent" stroke="#0AF"></path></svg>'
		path = svg.elements.path

	describe "pointAtFraction", ->

		it "should get the beginning", ->
			point = path.pointAtFraction(0)
			point.x.should.be.closeTo 100, 0.01
			point.y.should.be.closeTo 50, 0.01

		it "should get the end", ->
			point = path.pointAtFraction(1)
			point.x.should.be.closeTo 50, 0.01
			point.y.should.be.closeTo 0, 0.01

		it "should get a fraction", ->
			point = path.pointAtFraction(1/3)
			point.x.should.be.closeTo 50, 0.01
			point.y.should.be.closeTo 100, 0.01
			point = path.pointAtFraction(2/3)
			point.x.should.be.closeTo 0, 0.01
			point.y.should.be.closeTo 50, 0.01

	describe "positioning", ->
		it "should proxy the x and y property to the SVGLayer if that is it's direct parent", ->
			path.x.should.equal 123
			path.y.should.equal 456
			path.x = 23
			path.y = 17
			svg.x.should.equal 23
			svg.y.should.equal 17
