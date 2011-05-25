# Craig Ulliott
# some useful methods
module GeoRuby
  module SimpleFeatures
    class Point
      
      def to_x_y
        "#{x} #{y}"
      end
            
      def to_wkt_bounding_box range
        tl_point = Point.from_x_y(x-range, y-range)
        tr_point = Point.from_x_y(x+range, y-range)
        br_point = Point.from_x_y(x+range, y+range)
        bl_point = Point.from_x_y(x-range, y+range)
        points_text = [
          tl_point.to_x_y, 
          tr_point.to_x_y, 
          br_point.to_x_y, 
          bl_point.to_x_y, 
          tl_point.to_x_y
        ].join(',')
        "GeomFromText('Polygon((#{points_text}))')"
      end
      
    end
  end
end
