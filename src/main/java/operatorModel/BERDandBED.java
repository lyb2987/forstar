package operatorModel;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BERDandBED {
	private List<BERequestDetailDTO> list;
	private List<BEDetailDTO> beList;
}
