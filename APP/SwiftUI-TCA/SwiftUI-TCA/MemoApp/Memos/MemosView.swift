//
//  MemoView.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/16/24.
//

import SwiftUI
import ComposableArchitecture

struct MemosView: View {
    
    let store: StoreOf<Memos>
    @State private var isShowingBottomSheet = false
    @State private var bottomSheetType: BottomSheetType = .add(.fail)
    @State private var searchedText: String = ""
    @State private var isSearching: Bool = false
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                NavigationStack {
                    List {
                        ForEach(memoList(for: viewStore), id: \.id) { memo in
                            NavigationLink {
                                MemoEditor(memo: memo, memoEditType: .update) { memo in
                                    viewStore.send(.updateMemo(id: memo.id, title: memo.title, description: memo.description))
                                    bottomSheetType = .update(.success)
                                    isShowingBottomSheet.toggle()
                                }
                            } label: {
                                MemoView(memo: memo)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            let index = indexSet[indexSet.startIndex]
                            let id = viewStore.state.memos[index].id
                            viewStore.send(.deleteMemo(id))
                            bottomSheetType = .delete(.success)
                            isShowingBottomSheet.toggle()
                        })
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(.grouped)
                    .navigationTitle("메모")
                    .toolbar {
                        NavigationLink(destination: {
                            MemoEditor(memo: nil, memoEditType: .add) { memo in
                                viewStore.send(.addMemo(memo))
                                bottomSheetType = .add(.success)
                                isShowingBottomSheet.toggle()
                            }
                        }, label: {
                            Text("추가하기")
                                .font(.system(size: 18, weight: .regular))
                                .foregroundStyle(.black)
                        })
                    }
                }
                .modifier(NavigationBarStyleModifier())
                .searchable(text: $searchedText, placement: .navigationBarDrawer, prompt: "메모를 검색해보세요.")
                .onChange(of: searchedText) {
                    isSearching = !searchedText.isEmpty
                    viewStore.send(.findMemo(searchedText))
                }
                
                BottomSheet(isShowing: $isShowingBottomSheet, bottomSheetType: $bottomSheetType)
            }
        }
    }
    
    private func memoList(for viewStore: ViewStore<Memos.State, Memos.Action>) -> [Memo] {
        if isSearching {
            return viewStore.state.searchedMemos
        } else {
            return viewStore.state.memos
        }
    }
}
