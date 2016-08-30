//
//  CircleDataProvider.h
//  FluentResourcePaging-example
//
//  Created by Alek Astrom on 2013-12-28.
//  Copyright (c) 2013 Alek Åström. All rights reserved.
//

@import Foundation;

@class CircleDataProvider;
@protocol CircleDataProviderDelegate<NSObject>

@optional
- (void)dataProvider:(CircleDataProvider *)dataProvider willLoadDataAtIndexes:(NSIndexSet *)indexes;
- (void)dataProvider:(CircleDataProvider *)dataProvider didLoadDataAtIndexes:(NSIndexSet *)indexes;

@end

@interface CircleDataProvider : NSObject

- (instancetype)initWithPageSize:(NSUInteger)pageSize andProviderCount:(NSUInteger) providerCount;
- (void)cleanupPagedArray;

@property (nonatomic, weak) id<CircleDataProviderDelegate> delegate;

/**
 * The array returned will be a proxy object containing
 * NSNull values for data objects not yet loaded. As data
 * loads, the proxy updates automatically to include
 * the newly loaded objects.
 *
 * @see shouldLoadAutomatically
 */
@property (nonatomic, readonly) NSArray *dataObjects;

@property (nonatomic, readonly) NSUInteger pageSize;
@property (nonatomic, readonly) NSUInteger loadedCount;

/**
 * When this property is set, new data is automatically loaded when
 * the dataObjects array returns an NSNull reference.
 *
 * @see dataObjects
 */
@property (nonatomic) BOOL shouldLoadAutomatically;
@property (nonatomic) NSUInteger automaticPreloadMargin;

- (BOOL)isLoadingDataAtIndex:(NSUInteger)index;
- (void)loadDataForIndex:(NSUInteger)index;

@end
