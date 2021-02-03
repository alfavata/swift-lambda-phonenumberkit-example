import AWSLambdaEvents
import AWSLambdaRuntime
import Backtrace
import Foundation
import PhoneNumberKit

Backtrace.install()

typealias In = APIGateway.V2.Request
typealias Out = APIGateway.V2.Response

Lambda.run { (context, request: In, completionHandler: (Result<Out, Error>) -> Void) in
    completionHandler(.init(catching: {
        let pnk = PhoneNumberKit()
        let parsed = try pnk.parse(request.body ?? "")
        let formatted = pnk.format(parsed, toType: .e164)
        return Out(statusCode: .ok, body: formatted)
    }))
}
