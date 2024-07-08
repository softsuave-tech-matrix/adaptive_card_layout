import SwiftUI

@available(iOS 15.0, *)

public struct CardView: View {
    @Binding private var viewsArray: [AnyView]
    @Binding private var RowOrColumnNo: Int
    @Binding private var gridView: Bool
    
    
    private var scale: Bool
    private var scaleFactor: CGFloat
    private var frameWidth: CGFloat
    private var frameHeight: CGFloat
    private var additionalFrameHeight: CGFloat
    private var verticalSpacing: CGFloat
    private var horizontalSpacing: CGFloat
    private var onTap: ((Int) -> Void)?
    
    
    public init(viewsArray: Binding<[AnyView]>,
                scale: Bool = true,
                scaleFactor: CGFloat = 1.2,
                frameWidth: CGFloat = 150,
                frameHeight: CGFloat = 150,
                additionalFrameHeight: CGFloat = 30,
                gridView: Binding<Bool>,
                RowOrcolumnNo: Binding<Int>,
                verticalSpacing:CGFloat = 10,
                HorizontalSpacing:CGFloat = 10,
                onTap: ((Int) -> Void)? = nil) {
        
        self._viewsArray = viewsArray
        self._gridView = gridView
        self._RowOrColumnNo = RowOrcolumnNo
        self.frameWidth = frameWidth
        self.frameHeight = frameHeight
        self.additionalFrameHeight = additionalFrameHeight
        self.scale = scale
        self.scaleFactor = scaleFactor
        self.verticalSpacing = verticalSpacing
        self.horizontalSpacing = HorizontalSpacing
        self.onTap = onTap
    }
    
    @available(iOS 15.0, *)
    public var body: some View {
        ZStack  {
            VStack {
                if gridView {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: verticalSpacing) {
                                ForEach(0..<rowsCount(), id: \.self) { rowIndex in
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: horizontalSpacing) {
                                            ForEach(rowViews(for: rowIndex), id: \.self) { viewIndex in
                                                viewsArray[viewIndex]
                                                    .frame(width: frameWidth, height: frameHeight)
                                                    .onTapGesture {
                                                        self.onTap?(viewIndex)
                                                    }
                                            }
                                        }
                                    }
                                }
                            }
                            
                        }.padding(.leading, 10)
                    
                }
                else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(0..<RowOrColumnNo, id: \.self) { row in
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack( spacing: horizontalSpacing) {
                                        ForEach(getSegment(for: row), id: \.self) { viewIndex in
                                            GeometryReader { geometry in
                                                viewsArray[viewIndex]
                                                    .scaleEffect(scaleFactor(geometry: geometry))
                                                    .animation(.easeInOut, value: scaleFactor(geometry: geometry))
                                                    .onTapGesture {
                                                        self.onTap?(viewIndex)
                                                    }
                                            }
                                            .frame(width: frameWidth)
                                        }
                                    }
                                    .padding(.trailing, 20)
                                    .frame(height: frameHeight + additionalFrameHeight)
                                    
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    // Helper function to determine the content and manage the rows
   private func getSegment(for row: Int) -> [Int] {
        let totalItems = viewsArray.count
        let itemsPerRow = totalItems / RowOrColumnNo
        let remainder = totalItems % RowOrColumnNo
        
        let start: Int
        let end: Int
        
        if row < remainder {
            start = row * (itemsPerRow + 1)
            end = start + itemsPerRow + 1
        } else {
            start = row * itemsPerRow + remainder
            end = start + itemsPerRow
        }
        
        return Array(start..<end)
    }
    
    // Helper function for scaling effect for views
    private func scaleFactor(geometry: GeometryProxy) -> CGFloat {
        if scale {
            let midX = geometry.frame(in: .global).midX
            let screenWidth = UIScreen.main.bounds.width
            let distanceFromCenter = abs(screenWidth / 2 - midX)
            let scale = max(scaleFactor - (distanceFromCenter / (screenWidth/0.5)), 0.8)
            print(scale)
            return scale
        } else {
            return 1
        }
    }
    
    // Helper function to determine the number of rows needed
    private func rowsCount() -> Int {
        return (viewsArray.count + RowOrColumnNo - 1) / RowOrColumnNo
    }
    
    // Helper function to get the views for a specific row
    private func rowViews(for rowIndex: Int) -> [Int] {
        let startIndex = rowIndex * RowOrColumnNo
        let endIndex = min(startIndex + RowOrColumnNo, viewsArray.count)
        return Array(startIndex..<endIndex)
    }
}
