//
//  ContentView.swift
//  AATest
//
//  Created by Dylan Elliott on 3/12/2023.
//

import SwiftUI
import DylKit

struct ContentView: View {
    var body: some View {
        InternetDictionaryView()
            .padding()
    }
}

{"initVariables":{"elements":{"variables":{"_NEW_":{"type":"AnyValue","value":{"value":{"type":"StringValue","value":{"value":"TEXT"}}}}}}},"id":"E5813D4D-0127-4CDD-AC57-80CBD128453C","content":{"axis":{"value":"vertical"},"id":"28FF5C91-666A-4A2C-93C9-4F0867689462","content":{"value":{"constant":{"_0":{"type":{"title":"Base"},"elements":{"variables":[{"type":"MakeableLabel","value":{"fontSize":{"value":24},"base":{"padding":{"value":5},"backgroundColor":{"value":"00000000"},"cornerRadius":{"value":0}},"italic":{"value":true},"id":"D1D58C2C-74E6-4A32-9A05-C8DBF77A2440","fontWeight":{"value":"Semibold"},"text":{"value":{"type":"Variable","value":{"name":{"value":{"type":"StringValue","value":{"value":"IP"}}}}}},"isMultiline":{"value":false},"textColor":{"value":"000000FF"}}},{"type":"ScreenValue","value":{"id":"FF7F166A-5C7B-47BA-BD4D-51952ADE26BB","name":{"value":"DictList"},"arguments":{"elements":{"variables":{"DICT":{"type":"AnyValue","value":{"value":{"type":"Variable","value":{"name":{"value":{"type":"StringValue","value":{"value":"LOCATION"}}}}}}}}}}}}]}}}}},"base":{"padding":{"value":5},"backgroundColor":{"value":"00000000"},"cornerRadius":{"value":0}}},"initActions":{"steps":[{"type":"APIValueStep","value":{"url":{"value":{"type":"StringValue","value":{"value":"https:\/\/api.ipify.org?format=json"}}}}},{"type":"DecodeDictionaryStep","value":{"value":{"value":{"type":"Variable","value":{"name":{"value":{"type":"StringValue","value":{"value":"$0"}}}}}}}},{"type":"DictionaryValueForKeyStep","value":{"dictionary":{"value":{"variable":{"_0":{"name":{"value":{"type":"StringValue","value":{"value":"$0"}}}}}}},"key":{"value":{"type":"StringValue","value":{"value":"ip"}}},"errorIfNotFound":{"value":false}}},{"type":"SetVarStep","value":{"varName":{"value":{"type":"StringValue","value":{"value":"IP"}}},"value":{"value":{"type":"Variable","value":{"name":{"value":{"type":"StringValue","value":{"value":"$0"}}}}}}}},{"type":"SetVarStep","value":{"varName":{"value":{"type":"StringValue","value":{"value":"LOCATIONURL"}}},"value":{"value":{"type":"StringValue","value":{"value":"http:\/\/ip-api.com\/json\/"}}}}},{"type":"AddToVarStep","value":{"varName":{"value":{"type":"StringValue","value":{"value":"LOCATIONURL"}}},"value":{"value":{"type":"Variable","value":{"name":{"value":{"type":"StringValue","value":{"value":"IP"}}}}}}}},{"type":"APIValueStep","value":{"url":{"value":{"type":"Variable","value":{"name":{"value":{"type":"StringValue","value":{"value":"LOCATIONURL"}}}}}}}},{"type":"DecodeDictionaryStep","value":{"value":{"value":{"type":"Variable","value":{"name":{"value":{"type":"StringValue","value":{"value":"$0"}}}}}}}},{"type":"SetVarStep","value":{"varName":{"value":{"type":"StringValue","value":{"value":"LOCATION"}}},"value":{"value":{"type":"Variable","value":{"name":{"value":{"type":"StringValue","value":{"value":"$0"}}}}}}}},{"type":"DictionaryKeysStep","value":{"dictionary":{"value":{"variable":{"_0":{"name":{"value":{"type":"StringValue","value":{"value":"$0"}}}}}}}}},{"type":"SetVarStep","value":{"varName":{"value":{"type":"StringValue","value":{"value":"KEYS"}}},"value":{"value":{"type":"Variable","value":{"name":{"value":{"type":"StringValue","value":{"value":"$0"}}}}}}}}]},"name":"Internet Dictionary 2","subscreens":[]}
