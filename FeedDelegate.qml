import QtQuick 2.2

Rectangle {
    id: rootElement

    border.width: 1
    border.color: "blue"

    // Gets image URL from str
        function getImageUrl(str) {
            var matches = str.match(/<img src="(.*?)"/g);
            var result = "";
            if (matches === null) {
                result = "qrc:/Img/cropped-logo.png"
            }
            else {
                result = matches[0];
                result = result.slice(result.indexOf("\"") + 1, result.length - 1);
                result = "https:" + result;
            }

            return result;
        }

        // Deletes all HTML tags from str
        function getCleanText(str) {
            var clean = str.replace(/<\/?[^>]+(>|$)/g, "");
            return clean;
        }

       Rectangle {
           id: img
           width: rootElement.width/2 - border_width
           height: rootElement.height - 2*border_width
           anchors.verticalCenter : rootElement.verticalCenter
           anchors.leftMargin: border_width
           anchors.left: rootElement.left

           Image {
               id: icon
               anchors.fill: parent
               fillMode: Image.PreserveAspectCrop
               width: rootElement.width / 2
               height: rootElement.height - 4
               source: getImageUrl(description)
           }
       }

       Rectangle{
           id:txt
           width: rootElement.width / 2 - border_width
           height: rootElement.height - 2 * border_width
           anchors.verticalCenter : rootElement.verticalCenter
           anchors.left: img.right
           color: "#c0c0c0"

           Text {
               id: textmess
//               width: txt.width
//               height: txt.height
               anchors.fill: txt
               font.pixelSize: 14
               wrapMode: Text.WordWrap
               text: title
               clip: txt
               horizontalAlignment: Text.AlignLeft
           }
       }
}





/*Column {
    id: delegate
    width: delegate.ListView.view.width
    spacing: 8

    Item { height: 8; width: delegate.width }

    Row {
        width: parent.width
        spacing: 8
        Column {
            Item {
                width: 4
                height: titleText.font.pixelSize / 4
            }
            Image {
                id: titleImage
                width: 100
                height: 100
                source: getImageUrl(description)
            }
        }

        Text {
            id: titleText

            text: title
            width: delegate.width - titleImage.width
            wrapMode: Text.WordWrap
            font.pixelSize: 26
            font.bold: true
        }
    }

    Text {
        width: delegate.width
        font.pixelSize: 12
        font.italic: true
        text: "(<a href=\"" + link + "\">Link</a>)"
        onLinkActivated: {
            Qt.openUrlExternally(link)
        }
    }

    Text {
        id: pubDateText

        text: "pubDate: " + pubDate
        width: parent.width
        wrapMode: Text.WordWrap
        font.pixelSize: 14
    }

    Text {
        id: guidText

        text: "<guid isPermaLink=\"" + isPermaLink + "\">" + guid + "</guid>"
        width: parent.width
        wrapMode: Text.WordWrap
        font.pixelSize: 14
    }


    Text {
        id: descriptionText

        text: getCleanText(description)
        width: parent.width
        wrapMode: Text.WordWrap
        font.pixelSize: 14
    }

    Text {
        id: dcCreatorText

        text: "dc:creator: " + dcCreator
        width: parent.width
        wrapMode: Text.WordWrap
        font.pixelSize: 14
    }

    Text {
        id: dcSubjectText

        text: "dc:subject: " + dcSubject
        width: parent.width
        wrapMode: Text.WordWrap
        font.pixelSize: 14
    }

    Text {
        id: categoryText

        text: "category: " + category
        width: parent.width
        wrapMode: Text.WordWrap
        font.pixelSize: 14
    }

    Text {
        id: annotateReferenceText

        text: "annotate:reference: " + annotateReference
        width: parent.width
        wrapMode: Text.WordWrap
        font.pixelSize: 14
    }

    Text {
        id: commentsText

        text: "comments: " + comments
        width: parent.width
        wrapMode: Text.WordWrap
        font.pixelSize: 14
    }

}*/
